

mutable struct InputPTE <: AbstractInput

    prec::Array{Float64,2}
    tair::Array{Float64,2}
    epot::Array{Float64,1}

end

mutable struct InputPTE <: AbstractInput

    prec::Float64
    tair::Float64
    epot::Float64

end



mutable struct InputPT <: AbstractInput

    prec::Array{Float64,2}
    tair::Array{Float64,2}

end


mutable struct InputPT <: AbstractInput

    prec::Float64
    tair::Float64

end
