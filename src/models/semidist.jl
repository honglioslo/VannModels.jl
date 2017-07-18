



mutable struct SemiDistModel{s<:AbstractSnow, h<:AbstractHydro} <: AbstractModel
    
    snow::s
    hydro::h
    
end



function run_model(model::SemiDistModel, input::InputPTE)

    nstep = size(input.prec, 2)

    q_out = zeros(nstep)

    for t in 1:nstep

        # Run snow model component

        set_input(model.snow, input, t)

        run_timestep(model.snow)

        # Run hydrological component

        set_input(model.hydro, model.snow, input, t)

        run_timestep(model.hydro)

        q_out[t] = model.hydro.q_out

    end

    return q_out

end


function set_input(snow::AbstractSnow, input::InputPTE, t::Int64)

    for reg in eachindex(snow.frac)

        snow.tair[reg] = input.tair[reg, t]
        snow.p_in[reg] = input.prec[reg, t]

    end
    
end


function set_input(hydro::AbstractHydro, snow::AbstractSnow, input::InputPTE, t::Int64)

    hydro.epot = input.epot[t]
    hydro.p_in = 0.0

    for reg in eachindex(snow.frac)
        hydro.p_in += snow.frac[reg] * snow.q_out[reg]
    end
    
end