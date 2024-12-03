using RCall

function main()
    pkg_list = """
    install.packages(c(
        "dplyr",
        "data.table",
        "triangle",
        "mc2d",
        "fitdistrplus",
        "logspline",
        "tidyverse",
        "readxl",
        "profvis",
        "tools",
        "tidyr",
        "magrittr",
        "stringr",
        "ggplot2",
        "dampack",
        "kableExtra",
        "hrbrthemes",
        "viridis",
        "ggstatsplot",
        "rstantools",
        "magick",
        "lpSolve",
        "Benchmarking",
        "MASS",
        "sf",
        "rnaturalearth",
        "rnaturalearthdata",
        "Hmisc",
        "scales",
        "EIAdata",
        "gdata",
        "ggmap"
    ), repos="https://cloud.r-project.org");
    """

    if Sys.iswindows()
        # Workaround for https://github.com/JuliaInterop/RCall.jl/issues/341 on Windows

        # Make R locatable
        libR_dir = dirname(RCall.locate_libR(ENV["R_HOME"]))
        ENV["PATH"] *= libR_dir * ";"

        # Install dependencies by calling out to external R
        Rexe_path = replace(joinpath(libR_dir, "R.exe"), "\\"=>"/")
        pkg_install = replace(pkg_list, "\n"=>"", "\\"=>"")
        run(`$(Rexe_path) -e $(pkg_install)`)
    else
        # On other platforms, R libraries should be able to install fine
        R"""
        $(pkg_list)
        """
    end
end

main()
