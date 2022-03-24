#include "configadapter.h"

#include<qdebug>
ConfigAdapter::ConfigAdapter(QObject *parent)
    : QObject(parent)
{

}

void ConfigAdapter::cppSlotA()
{
    qDebug() << "CppObject::cppSlotA";
}
