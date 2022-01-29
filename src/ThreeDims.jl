module ThreeDims
    # It may be best to just to move the script here
    include("../stable_fluids_fft_3D.jl")

    precompile(main, ())
end