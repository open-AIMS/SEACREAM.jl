module CREAMext

using RCall

function __init__()
    @info "Installing required R packages - this may take a long time..."

    # Install required R libraries
    R"""
    package_list <- c(
        "dplyr",
        "data.table",
        "triangle",  # <- just in case
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
    )

    install.packages(package_list, repos="https://cloud.r-project.org")
    """
end

function run_cream(data_dir, indicator_data_dir, output_dir)
end

end # module CREAMext
