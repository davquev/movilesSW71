package com.example.appequipos.models

import com.google.gson.annotations.SerializedName

class ApiResponseDetails (
    @SerializedName("results")
    val results: Int,

    @SerializedName("teams")
    val teams: List<Team>
)