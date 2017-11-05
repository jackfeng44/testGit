#ifndef MODELS_GLOBAL_H
#define MODELS_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(MODELS_LIBRARY)
#  define MODELSSHARED_EXPORT Q_DECL_EXPORT
#else
#  define MODELSSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // MODELS_GLOBAL_H
