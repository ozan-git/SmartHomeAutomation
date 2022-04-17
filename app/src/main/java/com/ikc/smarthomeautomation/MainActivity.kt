package com.ikc.smarthomeautomation

import android.content.Context
import android.os.Bundle
import android.util.AttributeSet
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.navigation.NavController
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.setupActionBarWithNavController
import androidx.navigation.ui.setupWithNavController
import com.ikc.smarthomeautomation.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var appBarConfiguration: AppBarConfiguration
    private lateinit var navController: NavController
    private lateinit var dataBinding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        dataBinding = DataBindingUtil.setContentView(this, R.layout.activity_main)
        init()
    }

    private fun init() {
        val navHostFragment = supportFragmentManager
            .findFragmentById(R.id.main_nav_host) as NavHostFragment
        navController = navHostFragment.navController

        // Passing each menu ID as a set of Ids because each menu should be
        // considered as top level destinations.
        appBarConfiguration = AppBarConfiguration.Builder(
                R.id.navigation_home, R.id.navigation_dashboard, R.id.navigation_notifications
            ).build()
        // If you want to hide drawer or bottom navigation configure that in this function.
        visibilityNavElements(navController)
    }

    private fun visibilityNavElements(navController: NavController) {
        /**
         * Listen for the change in fragment (navigation) and hide or show drawer or bottom
         * navigation accordingly if required. Modify this according to your need.
         * If you want you can implement logic to deselect(styling) the bottom navigation
         * menu item when drawer item selected using listener.
         * */
        navController.addOnDestinationChangedListener { _, destination, _ ->
            when (destination.id) {
                R.id.bluetoothFragment -> {
                    hideBottomNav()
                }
                else -> {
                    showBottomNav()
                }
            }
        }
    }

    // Hide both drawer and bottom navigation bar.
    private fun hideBottomNav() {
        dataBinding.mainBottomNavigationView.visibility = View.GONE
    }

    private fun showBottomNav() {
        dataBinding.mainBottomNavigationView.visibility = View.VISIBLE

        //To configure navController with drawer and bottom navigation.
        setupNavControl()
    }

    private fun setupNavControl() {
        // Setup Bottom navigation with navController.
        dataBinding.mainBottomNavigationView.setupWithNavController(navController)
    }
}