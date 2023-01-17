package com.dream.flutter_log_plugin

import android.content.Context
import com.mf.log.LogUtils

object FlutterLogWrapper {

    fun init(context: Context) {
        LogUtils.init(context, "mf/log", "flutter")
    }

    fun unInit(){
        LogUtils.unInit()
    }

    fun log(level: String?, tag: String?, msg: String?) {
        when (level?.lowercase()) {
            "e" -> LogUtils.e(tag, msg)
            "w" -> LogUtils.w(tag, msg)
            "i" -> LogUtils.i(tag, msg)
            "v" -> LogUtils.v(tag, msg)
            else -> LogUtils.d(tag, msg)
        }
    }
}