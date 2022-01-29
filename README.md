# Efficient Stable Fluids Algorithm in the Julia Programming Language


2D Stable Fluids            |  3D Stable Fluids
:----------------------------:|:-------------------------:
![2d_collision](https://user-images.githubusercontent.com/27728103/151655433-89e6572f-098c-461c-969d-9076d5fb8716.gif)| ![3d_collision](https://user-images.githubusercontent.com/27728103/151655451-108a6134-0a35-4cf8-ba15-f4448215d427.gif)

Stable Fluids is an algorithm by Jos Stam to simulate the equations of fluid
mechanics 🌊 unconditionally stable. It is widely used in Computer Graphics 🖥  to
obtain realistic fluid motion. This is an implementation using the Fast Fourier
Transformation that greatly simplifies the steps of diffusion and
incompressibility projection.

The aim of the implementation (and the stable fluids algorithm in general) is to
be visually pleasing and realistic by the "eye norm". However, it is not as
accurate as more advanced techniques used in Computational Fluid Dynamics.

## How to run the files

Make sure you have all the dependencies installed. You can do so by entering a Julia REPL session and then execute

    ] add FFTW Plots ProgressMeter Interpolations LinearAlgebra WriteVTK

Then you can run the 2D version by

    julia stable_fluids_fft.jl

The 2D version is set up in a way that it interactively plots the curl
(=vorticity magnitude) of the velocity field while it is simulating.

To run the 3D version execute

    julia stable_fluids_fft_3d.jl

This will not interactively visualize, but rather writes out VTK files that you
can the later on visualize with another software, e.g. ParaView. You can find a
tutorial on how to create nice volume renderings [in this YouTube
video](https://youtu.be/bvPi6XwdM0U?t=1034)

## Understading the algorithm 👩‍🏫 

📺 Code along with me in [this vide](https://youtu.be/F7rWoxeGrko) to build the 2D version.

📺 Watch and follow along [this video](https://youtu.be/bvPi6XwdM0U) for the
extension to 3D as well as a tutorial on how to visualize the results in Paraview.

You can find similar simple implementations of our simulations in Julia and
Python [on the GitHub
Repo](https://github.com/Ceyron/machine-learning-and-simulation/tree/main/english/simulation_scripts)
of my [YouTube
Channel](https://www.youtube.com/channel/UCh0P7KwJhuQ4vrzc3IRuw4Q).


## Parameters of the algorithm

In the beginning of each file, directly after the doc string, you find constants
that will change the simulation.

1. **N_POINTS**: The number of vertices in the mesh per axis. Higher numbers will make your computer sweat more, but also allow you to resolve more details. For my Laptop (i7-8500u), 250 for 2D (250² = 62'500 dof) and 40 for 3D (40³ = 64,000) worked fine. If you have more powerful hardware, you can go higher, of course 😉.
2. **KINEMATIC_VISCOSITY**: This value defines how diffusive your simulation
   will be.
3. **TIME_STEP_LENGTH**: The dt of the time integration. Since the algorithm is
   unconditionally stable, it can be selected arbitrarily. Higher values will make your simulations advance faster. However, be aware that too high values can cause instability, since the ODE integrator for the back-tracing is just a plain explicit Euler. Additionally, higher time steps make your simulations less accurate.
4. **N_TIME_STEPS**: For how many iterations you want to run your time loop.

## References

The Stable Fluids Algorithm is based on the [1999 SIGGRAPH paper by Jos Stam](https://d2f99xq7vri1nk.cloudfront.net/legacy_app_files/pdf/ns.pdf). Here, we are using the [2002 extension with the FFT](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.590.1681&rep=rep1&type=pdf).
