// SIP Wrapper to the ISIS3 bundle class

%Import QtCore/QtCoremod.sip
%Import QtXml/QtXmlmod.sip

namespace Isis
{
    class BundleAdjust : public QObject {
      %TypeHeaderCode
      #include "BundleAdjust.h"
      %End

    public:
      BundleAdjust(const QString, const QString, bool printSummary = true);

     };
};
