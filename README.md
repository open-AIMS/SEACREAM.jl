# CREAMext.jl

Extension package for [ADRIA.jl](https://github.com/open-AIMS/ADRIA.jl) intended to act as
an interface to [CREAM](https://github.com/gbrrestoration/CREAM).

Note: This repository does not contain a copy of CREAM nor the data it depends on. These
must be requested from the original authors.

## Setup

The package is currently not registered but can be installed from the github repo.

With the Julia package manager:

```julia
] add https://github.com/open-AIMS/CREAMext.jl
```

Alternatively, a development copy can be set up by git cloning a local copy:

```bash
$ git clone https://github.com/open-AIMS/CREAMext.jl
```

and `dev`ing the repository (again, in the Julia package manager)

```julia
] dev <path to local copy>
```

An R interface package ([RCall.jl](https://github.com/JuliaInterop/RCall.jl)) is used to
facilitate interop between Julia and R.

An existing install of R may be used. Otherwise an installation of R specific for the Julia
project environment will be installed via Conda.

A customized R install can also be selected by defining a `LocalPreferences.toml` file in a
project directory. Copy/paste the entries below and adjust accordingly.

```toml
[RCall]
Rhome = "/path/to/env/lib/R"  # This should point to the directory where R is installed
libR = "/path/to/env/lib/R/lib/libR.so"  # Point to the libR.so file on linux or R.dll on Windows
```

See the RCall installation [instructions](https://juliainterop.github.io/RCall.jl/stable/installation/)
for more detail.

While pointing to a previously existing install is possible, it is highly recommended to
rely on a purpose-specific R environment.

The initial build of the package will attempt to install dependent R libraries as well.
Thus, installation requires an internet connection and may take some time.
