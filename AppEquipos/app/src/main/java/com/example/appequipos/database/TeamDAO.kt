package com.example.appequipos.database

import androidx.room.*
import com.example.appequipos.models.Team

@Dao
interface TeamDAO {
    @Insert
    fun insertTeam(vararg team: Team)

    @Query("SELECT * FROM teams")
    fun getAllTeams(): List<Team>

    @Delete
    fun deleteTeams(vararg team: Team)

    @Update
    fun updateTeams(vararg team: Team)
}