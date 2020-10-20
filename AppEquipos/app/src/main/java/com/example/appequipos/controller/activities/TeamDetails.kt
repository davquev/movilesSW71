package com.example.appequipos.controller.activities

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.appequipos.R
import com.example.appequipos.database.TeamDB
import com.example.appequipos.models.Team
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.squareup.picasso.OkHttp3Downloader
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_team_details.*

class TeamDetails : AppCompatActivity() {
    lateinit var fabSave: FloatingActionButton

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_team_details)

        val ivTeamDetails = ivTeamDetail
        val tvNameDetails = tvNameDetail
        val tvVenueName = tvVenueName
        val fabSave = fabSave

        initFields(this)
    }

    private fun initFields(context: Context) {
        val teamObject: Team? = intent.getSerializableExtra("Team") as Team?

        val picBiulder = Picasso.Builder(context)
        picBiulder.downloader(OkHttp3Downloader(context))
        picBiulder.build().load(teamObject?.logo).into(ivTeamDetail)

        tvNameDetail.text = teamObject?.name
        tvVenueName.text = teamObject?.venueName

        fabSave.setOnClickListener {
            saveTeam(teamObject)
            finish()
        }
    }

    private fun saveTeam(teamObject: Team?) {
        if (teamObject != null){
            TeamDB.getInstance(this).getTeamDAO().insertTeam(teamObject)
        }
    }
}