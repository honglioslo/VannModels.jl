module Vann2

using BlackBoxOptim
using CSV
using Distributions

# Abstract types

abstract type AbstractModel end
abstract type AbstractSnow end
abstract type AbstractHydro end
abstract type AbstractInput end



export AbstractModel, AbstractSnow, AbstractHydro, AbstractInput
export SemiDistModel
export InputPTE
export Gr4j
export TinBasic

export run_timestep, run_model
export load_data, crop_data
export get_param_ranges
export epot_zero
export init_states!
export run_model_calib
export get_params


include("inputs.jl")
include("components/gr4j.jl")
include("components/tinbasic.jl")
include("models/semidist.jl")
include("utils_data.jl")
include("utils_epot.jl")
include("utils_calib.jl")

end