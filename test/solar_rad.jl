date = DateTime(1980, 7, 20)

doy = Dates.dayofyear(date)

lat = -23.7951

elev = 546.0

dr = VannModels.inverse_dist(doy)

@test round(dr, 4) == 0.9688

δ = VannModels.solar_decl(doy)

@test round(δ, 4) == 0.3557

ω_s = VannModels.sunset_hour_angle(deg2rad(lat), δ)

@test round(ω_s, 4) == 1.4063

N = VannModels.daylight_hours(ω_s)

@test round(N, 4) == 10.7431

R_a = VannModels.extra_ter_rad(date, lat)

@test round(R_a, 4) == 23.6182

R_so = VannModels.clear_sky_rad(date, lat, elev)

@test round(R_so, 4) == 17.9716

