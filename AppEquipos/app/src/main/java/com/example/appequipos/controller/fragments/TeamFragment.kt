package com.example.appequipos.controller.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.appequipos.R
import com.example.appequipos.adapter.TeamAdapter
import com.example.appequipos.models.Team

class TeamFragment : Fragment(), TeamAdapter.OnItemClickListener {
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_team, container, false)
    }

    override fun onItemClicked(team: Team) {
        TODO("Not yet implemented")
    }
}