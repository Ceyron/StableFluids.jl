module TwoDims
    # It may be best to just to move the script here
    include("../stable_fluids_fft.jl")

    precompile(main, ())

    using ImageView
    using FileIO
    using PNGFiles
    
    function load_movie(n_frames = N_TIME_STEPS)
        first_frame = load("collision_2d_1.png")
        movie = Array{eltype(first_frame), 3}(undef, (size(first_frame)..., n_frames))
        movie[:,:,begin] = first_frame
        @info "Movie" size(movie)
        @showprogress "Loading pngs..." for (i,s) = enumerate(eachslice(movie; dims=3))
            s .= load("collision_2d_$i.png")
        end
        movie
    end
    function replay_movie(movie = load_movie())
        h = imshow(movie)
        p = h["gui"]["players"][1]
        push!(p.widget.direction, +1)
    end
end