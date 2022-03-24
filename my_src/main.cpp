#include "configadapter.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    qputenv("QSG_RENDER_LOOP", "basic");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    qmlRegisterType<ConfigAdapter>("CppType", 1, 0, "ConfigAdapter");//注册cpp
   
    QGuiApplication app(argc, argv);

    //启动qml引擎
    QQmlApplicationEngine engine;

    engine.addImportPath(TaoQuickImportPath);//引入外部qml库
    engine.rootContext()->setContextProperty("taoQuickImagePath", TaoQuickImagePath);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
