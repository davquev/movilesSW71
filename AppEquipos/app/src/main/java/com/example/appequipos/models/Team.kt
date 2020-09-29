package com.example.appequipos.models

import com.google.gson.annotations.SerializedName
import java.io.Serializable

class Team (
    @SerializedName("name")
    val name: String,

    @SerializedName("logo")
    val logo: String
): Serializable