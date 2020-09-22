package com.example.appshareprefs22_09

import android.content.Context

class SharedPreferences(val context: Context) {
    //definir el nombre de mi SharedP.
    private val PREFS_NAME = "sharedPreferences_name"

    //crear el SharedP.
    private val sharedPreference = context.getSharedPreferences(
        PREFS_NAME, Context.MODE_PRIVATE
    )

    //metodo grabar
    fun save(keyName: String, value: String){
        val editor = sharedPreference.edit()
        editor.putString(keyName, value)
        editor.commit()
    }

    //metodo get
    fun getValueString(keyName: String): String?{
        return sharedPreference.getString(keyName, null)
    }

    //metodo para limpiar el SharedP
    fun clearSharedPreference(){
        val editor = sharedPreference.edit()
        editor.clear()
        editor.commit()
    }

}