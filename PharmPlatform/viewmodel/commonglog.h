#ifndef COMMONGLOG_H
#define COMMONGLOG_H

#include <QString>
#include <QDir>
#include <QDebug>
#include <string>
#include <glog/logging.h>

class GlogHelper {
public:
    GlogHelper() {}
public:
    static void SignalHandel(const char *data,int size)
    {
        LOG(ERROR) <<  " " << std::string(data,size);
    }
    static void initGlog(char *argv)
    {
        std::string fullPath = qApp->applicationDirPath().toStdString();
        fullPath += "/Runlog/";
        QDir dir(QString::fromStdString(fullPath));
        if(!dir.exists(QString::fromStdString(fullPath)))
        {
            if(!dir.mkdir(QString::fromStdString(fullPath)))
            {
                qDebug() << "Created log path failed ";
                return;
            }
        }
        FLAGS_logbufsecs =0;        //缓冲日志输出，默认为30秒，此处改为立即输出
        FLAGS_max_log_size =100;  //最大日志大小为 100MB
        google::InitGoogleLogging(argv); //初始化glog
        google::SetLogDestination(google::GLOG_INFO,fullPath.c_str()); //设置 google::INFO 级别的日志存储路径和文件名前缀
        google::SetLogDestination(google::GLOG_ERROR,fullPath.c_str());
        google::SetLogDestination(google::GLOG_WARNING,fullPath.c_str());
        FLAGS_stop_logging_if_full_disk = true;     //当磁盘被写满时，停止日志输出
      //  google::InstallFailureWriter(&SignalHandel);
        LOG(INFO) << ":" << "Log start";
    }
};

#endif // COMMONGLOG_H
