% Eagerly Evaluated Questions, with Joseph Jevnik [Volume 13]
%
% 2016-08-12

*Joseph Jevnik is the author of [lazy
python](https://github.com/llllllllll/lazy_python), a pip-installable
library for Python that turns your Python into a lazily evaluated
language. I spoke with him over email about lazy evaluation and what
it's like to build such an impressive hack on top of Python. The
result is both informative and entertaining. I hope you enjoy!*

**Andrew: So first, I have to get it out of the way. Your GitHub username is
 `llllllllll`. Can you tell us the story behind that?**

**Joseph:** When I made my GitHub account I was playing a *lot* of StarCraft
II. In that game, userames are not unique, so many players decided to
name themselves with a "barcode" to be anonymous. This would make it
harder for people to know what strategies you were practicing or
stream snipe you. I chose to use this name on GitHub because I thought
it was fun. I have found it to be quite polarizing; some people think
it is funny and some people think it is really annoying. I have been
asked to change it a couple of times but I think it is too much fun. I
also like that the name that meant "anonymous" seems to draw a lot of
attention.

**A: I'm sure it's not, but have you by chance tried to see if your
string of 'l's is a valid barcode?**

**J:** I am not really sure how I would go about testing that.

**A: My guess is that a number of readers haven't been exposed to lazy
 evaluation. What is lazy evaluation, and why does adding it to
 Python make sense?**

**J:** Lazy evaluation, also known as "call by need", is an evaluation
strategy where values are produced when only needed. This is the
opposite of eager evaluation, what Python normally does, where
functions are executed as seen and values are produced
immediately. Python has some built in tools for lazily evaluating
code. One of the more explicit ways is with a generator. Generators
only produce values as requested as opposed to a list or tuple which
eagerly evaluates all of the members. Another way people get lazy
evaluation in Python is with closures.  By boxing up some code in a
closure, we can defer execution of that code until it is actually
called. To answer the second part of the question, why does adding
this to Python make sense: lazy evaluation could allow us write more
interesting optimizations by building up larger expressions before
executing any code. An example of a potential optimization is sharing
the results of common subexpressions. For example, given the following
expression:

```python
b = (a + 1) + (a + 1)
```

normal Python will execute `a + 1` twice, because it must evaluate
both operands before calling `+`. In a lazy execution model, this
would build up a tree of computation but not actually perform any of
it. If the user never needs to know the value of `b`, no work is
done. If the user does need to know the value of `b` then it can see
that it is an add of two of the same expression, at which point it can
eliminate the duplicate calls to `a + 1` and execute code more like:

```
_tmp = a + 1
b = _tmp + _tmp
```

*Note: This assumes that `+` is a pure function of its inputs. This
means that `+` does not have any observable side effects and depends
only on the inputs given.*

Other interesting optimizations are evaluating terms in parallel or
removing intermediate objects that are thrown away during
computation. These are very appealing optimizations when doing
scientific computing where your intermediate objects can be very large
or the problems are very parallelizable.

**A: There's been a lot of research into the implementation of lazy
evaluation, including the ever famous *[The spineless tagless
G-machine,
naturally](http://www.jonmountjoy.com/research/papers/98-icfp.pdf)*
paper that Haskell uses. What is the design of lazy python, and how
did you go about building it?**

**J:** Lazy python works by wrapping all the objects in a proxy which
builds up computations. The proxy object is called a `thunk`, which is
a standard term that means "deferred computation". The thunk class
overrides all of the data model (also known as magic) methods to
return new thunks that have the operation chained onto it.  This
system uses Python's normal, strict interpreter to build up the calls
that need to be made.

Lazy python uses cell model thunks. This means that thunks are
composed of three parts:

1. The code to execute when the value is requested.
2. The free variables closed over by the code.
3. The status flag that marks if the thunk has been evaluated along with the cached result of entering the code.

One of the important parts of a lazy evaluation system is that a
single computation must only be evaluated once. The cell model
accomplishes this by caching the result of the computation on the
thunk itself so that the next time the result is requested it may be
returned immediately without reentering the code. With the cell model,
it is the responsibility of the code which is requesting the result to
check and set the status of this cached value.

The STG machine uses the self-updating model for thunks. This model is
different in that it only has the code to execute and the free
variables. When the code is entered, it first evaluates the result
just like the cell model; however, before returning the value it
overwrites the thunk with a new thunk whose code cell is just `return
result`. This moves the updating and checking responsibility to the
thunk itself and simplifies the call sites. This also opens the door
for optimizations which do not check or update the code cell when it
is known that the value will only ever be needed once. When starting
lazy I wanted to go with a simple implementation and the cell model
seemed more clear and easier to debug.

Here is the definition of the `thunk` structure in lazy:

```
typedef struct{
    PyObject_HEAD
    PyObject *th_func;
    PyObject *th_args;
    PyObject *th_kwargs;
    PyObject *th_normal;
}thunk;
```

*Note: `PyObject*` is the C type used to represent all python objects.*

The first part of the struct definition, `PyObject_HEAD`, is a macro
that says that this is a python object. This is where the type and the
reference count are stored. The `th_func` field defines the code for
our closure represented as a callable Python object. `th_args` and
`th_kwargs` are the free variables, these will be passed to `th_func`
as the positional and keyword arguments when we enter our
code. Finally we have `th_normal` which is the result of calling
`th_func(*args, **kwargs)`. When a new thunk is created, this is
`NULL`.  This field is named `th_normal` because it is the "normal"
form of the computation, this is the standard term for the final
result of a computation which contains no thunks.

Imagine the lazy code: `a + 1`. This will turn into a thunk like:

```
th_func = operator.add,
th_args = (a, 1)
th_kwargs = NULL
th_normal = NULL
```

When we scrutinze this thunk, we first check the `th_normal` field. If
it is `NULL` it means we have never executed this thunk before. We
then strictly evaluate the `th_func`, all of the `th_args`, and all of
the `th_kwargs` (if any). We then call `normal_func(*normal_args,
**normal_kwargs)`. If the result of this call is a `thunk` itself we
enter it and continue evaluating until we get a concrete value. This
ensures that `th_normal` never holds a `thunk`. We then update the
`th_normal` field and release the `th_func`, `th_args`, and
`th_kwargs` and set those fields to `NULL`. This is done so that we
don't leak the intermediates needed to compute the value.

Another difference between lazy python and the STG machine are the
evaluation points. In lazy, I have used the term "strict point" but I
am not sure that is the formal term. The idea is that there are some
operations in the language which cannot be deferred, and these are the
only places where code cells are entered. In the STG language this is
just the `case` expression. The `case` expression evaluates the
argument, called the "scrutinee", and then tries it against different
"alternatives". These alternatives can be as simple as comparing the
value against a literal like:

```
case a of
    0# -> -- code to evaluate when a == 0
    1# -> -- code to evaluate when a == 1
    -- so on
```

Or as interesting as destructuring a value based on the constructor
like:

```
case someList of
    Nil  {}          -> -- code to evaluate when `someList` is empty
    Cons {head,tail} -> -- code to evaluate when `someList` is non-empty; this
                        -- also binds `head` and `tail` in this alternative
```

Lazy python uses different evaluation points. The most basic is the
`strict` function. The `strict` function evaluates a thunk to
normal form. This is very close the the `seq` function in
haskell. This allows users to explicitly request the value of a
computation. This is useful when one wants to call a function for the
side effects, for example: `print`. Imagine the following lazy code:

```
print('hello world')
```

This will turn into a `thunk`: `thunk(print, 'hello world')`. We don't
actually enter the call to `print` until the result of the print is
requested; however, we don't normally use the result of `print` for
anything so this thunk would get dropped. If we replace this with:

```
strict(print('hello world'))
```

then we will be explicitly asking for the result which will enter the
`print` function and we can see `hello world` printed to the terminal.

Another construct that is strict is `if`. In order to know which
branch to enter we need to know the truthiness of the expression.

This means that we can think of

```
if expression:
    return true_expression
else:
    return false_expression
```

in terms of the STG language like:

```
case expression of
    True  {} -> true_expression
    False {} -> false_expression
```

A more unique strict point is `__next__`. To show why this must be
strict, imagine the following code:

```
for n in range(5):
    strict(print('hello'))
```

If `__next__` was lazy this loop would never terminate. Each time the
for loop requests the next value from `iter(range(5))` it would just
be a thunk which hasn't actually driven any computation. This would
never raise a `StopIteration` so the loop would continue printing
forever. The easy solution is just to make `__next__` force the result
so that the loop strictly computes the iterator but the body can still
build up a thunk. Imagine this lazy reduce:

```
def sum_(ns):
    acc = 0
    for n in ns:
        acc += n
    return acc

result = sum_((1, 2, 3, 4))
```

This code will immediatly force the `iter((1, 2, 3, 4))`; however,
`result` will be a thunk that looks like: `((1 + 2) + 3) + 4`

When I started working on lazy I just tried writing it in normal
Python. The class looked something like:

```
class thunk:
    def __init__(self, func, args, kwargs):
        self.func = func
        self.args = args
        self.kwargs = kwargs

    def __add__(self, other):
        return type(self)(operator.add, self, other)

    def __sub__(self, other):
        return type(self)(operator.sub, self, other)

    ...
```

This seemed to work; however, I needed to do very tricky things to
make `__getattribute__` correct while still storing state on the
object. I tried moving the state into a weak dictionary keyed by the
thunk and other tricks but all of this contributed to very poor
performance. The class was just too much overhead to every Python
operation. This led me to write the implementation in C (and too much
C preprocessor ;_;). Writing `thunk` in C also allowed me to wrap C
specific APIs where it makes sense, for example, the sequence
protocol.

Another thing I ran into was enforcing that all objects are
`thunks`. Imagine the lazy code:

```
def f(a):
    return a + 1
```

This is only lazy if `a` is already a `thunk`, `f(1)` will still
eagerly compute `1 + 1` and return immediately.

To solve this problem I worked on a project to rewrite the bytecode so
that all the name lookups wrapped the value in thunks. This would mean
that when I called `f(1)`, the code internally would do a lookup for
the variable `a`, but instead of returning `1`, it would return
`thunk(lambda a: a, 1)`. Then, when I return `a + 1`, it would create
a new thunk like: `thunk(operator.add, thunk(lambda a: a, 1), 1)`. I
also used the bytecode rewriting to support things like `a is b`
turning into `thunk(operator.is_, a, b)` and literals would turn into
thunks which evaluate to their value. This specific submodule was
split out of lazy about a year ago and has become a very nice
standalone library for arbitrary bytecode manipulation.

As a side note: I have recently begun working on an inplementation of
the STG machine targetting GCC JIT, though I am writing that in C++:
[gg](https://github.com/llllllllll/gg).

**A: Are there "production" applications out there in the wild, that you
know of, using lazy python, or is it still just a curiosity, of
sorts?**

**J:** I would be suprised to find out someone has been using lazy python in
production, mainly because I would wonder what they needed it for. The
closest thing to a production ready tool built with lazy is a project
called [daisy](http://daisy-python.readthedocs.io/en/latest/), which
is the combination of [dask](http://dask.pydata.org/en/latest/) and
lazy. `dask` is a library for parallelization and distributed
computing. `dask` is a really cool project which can dramatically
speed up many numerical computing tasks. It is also really good at
working on out of core datasets, or datasets which do not fit into
RAM. `daisy` works by creating a special subclass of `thunk` which
compiles a lazy expression into a `dask` graph. It also implements
things like sharing of common subexpressions. `daisy` passes this off
to `dask` where the expression can be computed in parallel or across a
cluster. This makes it really easy to get better performance for
"free", where free means not altering the expression you wanted to
parallelize. The runtime overhead of `daisy` is still pretty high so
it only helps with things that are either duplicating a lot of work,
extremely parallizable, or really really large arrays.

**A: I've tried to bend Python 2 against its will in the past to do a
variety of different things, though, I never pushed the limits quite
as far as you have. What do you think it is about Python that
attracts this kind of playfulness and experimentation?**

**J:** I think that the simplicity of Python makes it possible for people to
build very interesting tools on top of it. The data model is
straightforward and all of the syntax boils down to pretty clear
functionality. On top of that, most of the behavior can be overridden
and customized allowing people to experiment with fun extensions very
quickly. This doesn't just stop at the object model though, users can
define their own file encodings or patch out the builtin compile
function to do all kinds of interesting things. Doing any of this in
another language would be a much more involved process which would
probably require forking the compiler or interpreter. Another reason
that I like Python, though I don't know how much this affects others,
is that the C API is very good. At the C level, you can do anything
you want to the interpreter so there is no limit to the amount of
"magic" you can build.

**A: I've never heard the Python C API described as "good," though, to be
honest, I almost never hear anyone talk about it. What makes the
Python API good, and how does it compare to an API like Lua's, which
is often celebrated for its easy to use C API?**

**J:** I find the API very straightforward to use. The functions are
namespaced well and there are only a few key ideas that you need to
understand to use it effectively. The documentation is also very nice
which helped me learn it very quickly. I think it is also pretty easy
to link the C code back to the Python equivalent. For example,
function are normally namespaced like `Py<type>_<method>`, for
example: `PyList_Append`. This is the same as `list.append` in
Python. The way types are defined is also pretty close to actual
Python classes. The difference is that there are special type slots
for the primitive functions, so instead of defining an `__iter__`
method, you just write a C function and put it in the `tp_iter` slot
of the `PyTypeObject` you are creating. I do find it to be very
verbose, especially around error handling. It is unsafe to nest any
expressions because the intermediate expression may fail. For example,
to write `f(a, g(b))` in the CPython API, one must write:

```
PyObject *tmp;
PyObject *result;

if (!(tmp = PyObject_CallFunctionObjArgs(g, b, NULL))) {
    /* handle the case where g(b) raises an exception */
    return NULL;
}

if (!(result = PyObject_CallFunctionObjArgs(f, a, tmp, NULL))) {
    return NULL;
}

Py_DECREF(tmp);
return result;
```

As you can imagine this causes the length of the code to grow
dramatically; but, I don't think it is that bad that you must
explicitly list all the failure modes.

I have never used Lua before so I cannot compare it with Python
directly. With the Python C API I am always writing C code to support
existing Python code instead of writing Python to support C code. I
think the direction is important because I am not sure I would choose
to use Python as an embedded scripting language for a C application
which is how I think Lua is normally used. In the past I have used GNU
Guile, the GNU implementation of Scheme, for adding a scripting
language to a C application. I find their API to be much nicer inside
of C because it uses garbage collected objects and provides quick
conversion to and from C types. It is also designed for this purpose,
so the the docs always show both the C function and the Scheme
function next to each other.

**A: Other than lazy python, which ranks among my favorite Python
 "hacks," what others have you been inspired or intrigued by?**

**J:** One of my favorite Python hacks is James Powell's
[rwatch](https://github.com/dutc/rwatch) project. This project adds
the ability to register a callback to be invoked whenever an object is
pushed onto a Python function's data stack. Already that is a really
cool feature, but the implementation is really fun. The project works
by overwriting the x86 opcodes in the `PyFrame_EvalFrameEx` to jump to
a custom implementation that uses the registered callbacks. This means
that the core interpreter loop is being replaced at runtime, all with
a package that you can pip install! All of James' projects are very
cool.

Another project that I find really cool is Phillip Cloud's
[req](https://github.com/cpcloud/req). This project is an AST visitor
for Python code that emits `q`, the query language for the `kdb+`
database. `q` is in the APL family of languages and is not the most
readable. I like this project because it allows people to use one of
the most readable languages ever made to write one of the least
readable languages ever made.

Finally, I have been inspired by
[quicklambda](https://github.com/abarnert/quicklambda). I cannot
remember where I first saw this project but I thought the syntax was
pretty cool. I have played around with Scala and C++ `std::bind` so I
thought the syntax looked very intuitive. This project inspired me so
much that I wrote a direct response:
[fz](https://github.com/llllllllll/fz). The main difference with `fz`
is that it compiles the final expression into a single Python function
to be executed instead of executing a tree of lambdas. This makes `(_1
+ 1) * 2` produce the same bytecode as `lambda _1: (_1 + 1) * 2` which
gives really good performance.

**A: Any other, non-Python related, hacks / projects that are on your
  radar?**

**J:** One project that I am following which I mentioned briefly is [GCC
JIT](https://gcc.gnu.org/onlinedocs/jit/). This is a new feature of
GCC that I don't think many people know about yet. GCC JIT is a
frontend for GCC that provides a high level API for generating
code. This gives you all the power of the GCC compiler optimizations
and access to debugging features in GDB. This can also be used as an
ahead of time compiler so GCC JIT can be used as the code generation
step of some higher level compiler. Right now the easiest way to get
this is to just clone GCC and compile a second version with
`--enable-shared` and `--enable-languages=jit` (and a whole bunch of
other standard flags). As a warning, this feature is currently in
alpha, so don't go building a production system on it; but, definitely
try it out and report your findings to the developers!

Another project that I have been following is [GCC
MELT](https://gcc.gnu.org/wiki/MiddleEndLispTranslator) (the normal
site is gcc-melt.org but that was down for me at the time of writing
this). This project is really something. It is a Lisp compiler built
as a meta-plugin for GCC to enable writing plugins in a custom Lisp
dialect. This custom Lisp is compiled into C++ and then compiled into
a shared object to be dynamically loaded by the MELT plugin for
GCC. By itself that would be pretty cool but it also has a lot of
features designed specifically for GCC plugin development like
abstractions over many of the internal data structures and pattern
matching macros for walking the AST. It also can work very well with
existing C++ code because it can work with unboxed values and escape
to C++ code directly. An interesting example of what can be done with
MELT is a plugin for typechecking custom variadic functions for the
janson project. janson is a C library for working with json, and there
is a GCC plugin written in MELT which checks all of the calls of
`json_pack` and `json_unpack` and validates at compile time that the
format string is valid and that the variadic types match the types
specified in the format string! You could also use this to add custom
attributes for values or functions to build some kind of lifetime
management or refcounting checks into the compilation process. This is
also a really good project for learning the details of GCC and getting
a better sense for all of the passes and various intermediate
representations that your code goes through on its path to machine
code.

Sorry for picking two projects related to GCC; but, I imagine that
most people interested in lazy evaluation have some interest in
compilers as well.


**A: Thanks so much for taking the time to talk about all this! I think I
can safely say that everyone will learn a lot from your
explanations, and lazy python is simply just rad.**

**J:** Thank you so much for chatting with me about lazy python! Hopefully there is
enough interesting content here to write about for the mailing list.
