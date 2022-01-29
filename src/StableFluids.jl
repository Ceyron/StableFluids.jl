"""
StableFluids.jl

See https://github.com/Ceyron/StableFluids.jl#readme

Functions
* `StableFluids.run_2D()`: Run 2D simulation
* `StableFluids.run_3D()`: Run 3D simulation

"""
module StableFluids
    include("TwoDims.jl")
    include("ThreeDims.jl")

    run_2D() = TwoDims.main()
    run_3D() = ThreeDims.main()
end