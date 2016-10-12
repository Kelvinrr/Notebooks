%Import QtCore/QtCoremod.sip
%Import QtXml/QtXmlmod.sip

%Import BundleObservationSolveSettings.sip


namespace Isis
{

  class BundleSettings  {
    %TypeHeaderCode
    #include "BundleSettings.h"
    %End
  public:
    BundleSettings();
    void setValidateNetwork(bool);

    void setSolveOptions(bool solveObservationMode = false,
                         bool updateCubeLabel = false,
                         bool errorPropagation = false,
                         bool solveRadius = false,
                         double globalLatitudeAprioriSigma = Isis::Null,
                         double globalLongitudeAprioriSigma = Isis::Null,
                         double globalRadiusAprioriSigma = Isis::Null);

   void setOutlierRejection(bool outlierRejection,
                            double multiplier = 1.0);

   void setObservationSolveOptions(QList<BundleObservationSolveSettings> obsSolveSettingsList);

   bool solveObservationMode() const;
   bool solveRadius() const;
   bool updateCubeLabel() const;
   bool errorPropagation() const;
   bool outlierRejection() const;
   double outlierRejectionMultiplier() const;
   double globalLatitudeAprioriSigma() const;
   double globalLongitudeAprioriSigma() const;
   double globalRadiusAprioriSigma() const;

   int numberSolveSettings() const;
   BundleObservationSolveSettings observationSolveSettings(QString instrumentId) const;
   BundleObservationSolveSettings observationSolveSettings(int n) const;

   enum MaximumLikelihoodModel {
     NoMaximumLikelihoodEstimator,
     Huber,
     ModifiedHuber,
     Welsch,
     Chen
   };

   void addMaximumLikelihoodEstimatorModel(MaximumLikelihoodWFunctions::Model model,
                                           double cQuantile);
   QList< QPair< MaximumLikelihoodWFunctions::Model, double > >
       maximumLikelihoodEstimatorModels() const;

   int numberTargetBodyParameters() const;
   bool solveTargetBody() const;
   bool solvePoleRA() const;
   bool solvePoleRAVelocity() const;
   bool solvePoleDec() const;
   bool solvePoleDecVelocity() const;
   bool solvePM() const;
   bool solvePMVelocity() const;
   bool solvePMAcceleration() const;
   bool solveTriaxialRadii() const;
   bool solveMeanRadius() const;
  };
};
