#pragma once
#include <QObject>
#include <QSettings>

class ConfigAdapter : public QObject
{
    Q_OBJECT

public:
    explicit ConfigAdapter(QObject *parent = nullptr);


public slots:
    //public槽函数可以在QML中访问
    void cppSlotA();//一个无参槽函数
};
