package de.appento.countdown


import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.graphics.Color
import android.net.Uri
import android.widget.RemoteViews
import de.appento.countdown.R
import es.antonborri.home_widget.HomeWidgetPlugin
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.temporal.ChronoUnit


/**
 * Implementation of the BasicDaysLeftWidget
 * Retrieves the data from flutter and shows days and hours left until the event
 */
class BasicDaysLeftWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {

        for (appWidgetId in appWidgetIds) {
            // Get reference to SharedPreferences
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.basic_days_left_widget).apply {
                // Get widget data
                val timestampString = widgetData.getString("eventTimestamp", null)
                val title = widgetData.getString("eventText", null)
                var inputColor = (widgetData.getString("eventColor", "#FFFFFF") as String)

                // show hint if no data is set
                if (timestampString == null || title == null || inputColor == null) {
                    setTextViewText(R.id.eventTextTextView, context.getString(R.string.openAppFirstHint))
                } else {
                    // if data is set, calculate and show the time left
                    val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS")
                    val timestamp = LocalDateTime.parse(timestampString, formatter)
                    val countUpMode = widgetData.getBoolean("countUpMode", false)

                    // Calculate total seconds difference (matching Flutter's Duration behavior)
                    val totalSeconds: Long = if (countUpMode) {
                        // Count up: time since the event
                        ChronoUnit.SECONDS.between(timestamp, LocalDateTime.now())
                    } else {
                        // Count down: time until the event
                        ChronoUnit.SECONDS.between(LocalDateTime.now(), timestamp)
                    }

                    // Show 0 if countdown done or countup in future
                    val totalHours = if (totalSeconds < 0) 0 else totalSeconds / 3600
                    val daysToShow = totalHours / 24
                    val hoursToShow = totalHours % 24

                    // Set days and hours (always positive)
                    setTextViewText(R.id.daysLeftTextView, daysToShow.toString())
                    setTextViewText(R.id.hoursLeftTextView, hoursToShow.toString())

                    // Set event subtitle
                    setTextViewText(R.id.eventTextTextView, title ?: "")

                    // Set background color
                    val color = Color.parseColor(inputColor)
                    setInt(R.id.widget_container, "setBackgroundColor", color)
                }
            }

            // Launch MainActivity when clicking on widget
            val pendingIntentWithData = HomeWidgetLaunchIntent.getActivity(
                context,
                MainActivity::class.java,
                Uri.EMPTY
            )
            views.setOnClickPendingIntent(R.id.widget_container, pendingIntentWithData)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }

    override fun onEnabled(context: Context) {
        // Enter relevant functionality for when the first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality for when the last widget is disabled
    }

}