package com.example.appequipos.controller.activities

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.appequipos.R
import com.example.appequipos.adapter.TeamAdapter
import com.example.appequipos.models.ApiResponseHeader
import com.example.appequipos.models.Team
import com.example.appequipos.network.TeamService
import kotlinx.android.synthetic.main.activity_main.*
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class MainActivity : AppCompatActivity() {

    lateinit var teamRecyclerView: RecyclerView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        teamRecyclerView = rvTeams
        loadTeams(this)
    }

    private fun loadTeams(mainActivity: MainActivity) {
        val retrofit = Retrofit.Builder()
            .baseUrl("https://api-football-v1.p.rapidapi.com/v2/teams/league/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        val teamService: TeamService
        teamService = retrofit.create(TeamService::class.java)

        val request = teamService.getTeams(
            "api-football-v1.p.rapidapi.com",
            "d229813befmsh4c1646ad132a0b5p1313fcjsn9afecaefc97e")

        request.enqueue(object : Callback<ApiResponseHeader>{
            override fun onFailure(call: Call<ApiResponseHeader>, t: Throwable) {
                TODO("Not yet implemented")
            }

            override fun onResponse(call: Call<ApiResponseHeader>, response: Response<ApiResponseHeader>) {
                if (response.isSuccessful){
                    val teams: List<Team> =response.body()!!.api.teams ?: ArrayList()
                    teamRecyclerView.layoutManager = LinearLayoutManager(this@MainActivity)
                    teamRecyclerView.adapter = TeamAdapter(teams, this@MainActivity)
                }
            }
        })
    }
}