# SEACREAM.jl

**Note: This is a work in progress and currently non-functional**.

SEACREAM is a workflow orchestration package to seamlessly Stage/Evaluate/Aggregate (SEA)
reef ecology model results, obtain indicators, run cost models, and finally obtain economic
analyses with [CREAM](https://github.com/gbrrestoration/CREAM).

It is intended as an extension package for
[ADRIA.jl](https://github.com/open-AIMS/ADRIA.jl), with which scenario analyses could be
conducted.

Note: This repository does not contain a copy of CREAM, the cost models, or the reef
ecosystem models. These must be requested from the original authors or copies cloned
from their respective repositories.

## Setup

The package is currently not registered but can be installed from the github repo.

With the Julia package manager:

```julia
] add https://github.com/open-AIMS/SEACREAM.jl
```

Alternatively, a development copy can be set up by git cloning a local copy:

```bash
$ git clone https://github.com/open-AIMS/SEACREAM.jl
```

and `dev`ing the repository (again, in the Julia package manager)

```julia
] dev <path to local copy>
] build  # Note R installation notes below!
```

### Indicative usage

SEACREAM is currently non-functional, however the preliminary workflow would be:

```julia
using SEACREAM


SEACREAM.pipeline(
    settings_for_RME,
    cost_model_config,
    settings_for_CREAM,
    path_to_shared_output_directory
)
```

### R interoperability

An R interface package ([RCall.jl](https://github.com/JuliaInterop/RCall.jl)) is used to
facilitate interop between Julia and R (necessary for CREAM).

An existing install of R may be used and is highly recommended, especially for Windows.
due to [this open issue](https://github.com/JuliaInterop/RCall.jl/issues/341).

An existing R installation can be selected by defining a `LocalPreferences.toml` file in a
project directory. Copy/paste the entries below and adjust accordingly.

```toml
[RCall]
Rhome = "/path/to/env/lib/R"  # This should point to the directory where R is installed
libR = "/path/to/env/lib/R/lib/libR.so"  # Point to the libR.so file on linux or R.dll on Windows
```

See the RCall installation
[instructions](https://juliainterop.github.io/RCall.jl/stable/installation/) for more
detail.

Pre-installing all R dependencies will help initial start times.
Otherwise, the very first build of SEACREAM will require R dependencies to be installed.
Julia will appear to hang for a long time, as the dependencies has to download and compile
a lot of C/C++ dependencies.

While pointing to a previously existing install is possible, it is highly recommended to
rely on a purpose-specific R environment.

The initial build of the package will attempt to install dependent R libraries as well.
Thus, installation requires an internet connection and may take some time.

### Python Interoperability

A Python interface package ([PythonCall.jl](https://github.com/JuliaPy/PythonCall.jl)) is
used to facilitate interop between Julia and Python.

An existing install of Python may be used. Otherwise an installation of Python specific for
the Julia project environment will be installed via CondaPkg.

To use an existing Python installation, set environment variables before loading PythonCall
for the first time:
```julia
ENV["JULIA_CONDAPKG_BACKEND"] = "Null"
ENV["JULIA_PYTHONCALL_EXE"] = "/path/to/python"  # Point to your Python executable
using PythonCall
```

To find the Python path, run `which python` (Linux/Mac) or `where python` (Windows) in a
terminal.

Alternatively, these can be set persistently in a `LocalPreferences.toml` file in the
project directory:
```toml
[PythonCall]
executable = "/path/to/python"

[CondaPkg]
backend = "Null"
```

See the PythonCall [configuration documentation](https://juliapy.github.io/PythonCall.jl/stable/pythoncall/#Configuration)
for more detail.

While pointing to a previously existing install is possible, it is highly recommended to
rely on a purpose-specific Python environment.

### Installation Notes

The initial build of the package will attempt to install dependent R and Python libraries
as well. Thus, installation requires an internet connection and may take some time.
