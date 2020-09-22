package com.example.appshareprefs22_09

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val sharePreference = SharedPreferences(this)

        btSave.setOnClickListener {
            val cuenta = etName.text.toString()
            sharePreference.save("cuenta", cuenta)

            Toast.makeText(this, "Data stored", Toast.LENGTH_LONG).show()
        }

        btRetrieve.setOnClickListener {
            tvRetrieve.setText(sharePreference.getValueString("cuenta"))

            Toast.makeText(this, "Data retrieved", Toast.LENGTH_LONG).show()
        }
    }
}