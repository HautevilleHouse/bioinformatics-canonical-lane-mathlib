import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.DataProcessingInequalityPackage
import HautevilleHouse.BioinformaticsCanonicalLaneLean.InformationTheoryEvidenceTerms

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure ShannonEntropyCertificate (P : DataProcessingInequalityPackage) where
  entropyDefined : Bool
  jointEntropyDefined : Bool
  conditionalEntropyDefined : Bool
  chainRuleHolds : Prop
  entropyDefinedClosed : entropyDefined
  jointEntropyDefinedClosed : jointEntropyDefined
  conditionalEntropyDefinedClosed : conditionalEntropyDefined
  chainRuleHoldsClosed : chainRuleHolds
  dataProcessingEvidence : DataProcessingInequalityEvidence P

def ShannonEntropyCertificateClosed {P : DataProcessingInequalityPackage}
    (C : ShannonEntropyCertificate P) : Prop :=
  C.entropyDefined ∧ C.jointEntropyDefined ∧ C.conditionalEntropyDefined ∧ C.chainRuleHolds ∧
  DataProcessingInequalityClosed P

theorem shannon_entropy_certificate_closed {P : DataProcessingInequalityPackage}
    (C : ShannonEntropyCertificate P) : ShannonEntropyCertificateClosed C := by
  exact And.intro C.entropyDefinedClosed
    (And.intro C.jointEntropyDefinedClosed
      (And.intro C.conditionalEntropyDefinedClosed
        (And.intro C.chainRuleHoldsClosed
          (data_processing_inequality_closed_from_evidence P C.dataProcessingEvidence))))

structure ChannelCapacityCertificate {P : DataProcessingInequalityPackage} where
  capacityDefined : Bool
  capacityReachable : Bool
  codingTheoremHolds : Prop
  capacityDefinedClosed : capacityDefined
  capacityReachableClosed : capacityReachable
  codingTheoremHoldsClosed : codingTheoremHolds
  dataProcessingEvidence : DataProcessingInequalityEvidence P

def ChannelCapacityCertificateClosed {P : DataProcessingInequalityPackage}
    (C : ChannelCapacityCertificate P) : Prop :=
  C.capacityDefined ∧ C.capacityReachable ∧ C.codingTheoremHolds ∧
  DataProcessingInequalityClosed P

theorem channel_capacity_certificate_closed {P : DataProcessingInequalityPackage}
    (C : ChannelCapacityCertificate P) : ChannelCapacityCertificateClosed C := by
  exact And.intro C.capacityDefinedClosed
    (And.intro C.capacityReachableClosed
      (And.intro C.codingTheoremHoldsClosed
        (data_processing_inequality_closed_from_evidence P C.dataProcessingEvidence)))

structure RateDistortionCertificate {P : DataProcessingInequalityPackage} where
  rateDistortionFunctionDefined : Bool
  achievabilityHolds : Prop
  converseHolds : Prop
  rateDistortionFunctionDefinedClosed : rateDistortionFunctionDefined
  achievabilityHoldsClosed : achievabilityHolds
  converseHoldsClosed : converseHolds
  dataProcessingEvidence : DataProcessingInequalityEvidence P

def RateDistortionCertificateClosed {P : DataProcessingInequalityPackage}
    (C : RateDistortionCertificate P) : Prop :=
  C.rateDistortionFunctionDefined ∧ C.achievabilityHolds ∧ C.converseHolds ∧
  DataProcessingInequalityClosed P

theorem rate_distortion_certificate_closed {P : DataProcessingInequalityPackage}
    (C : RateDistortionCertificate P) : RateDistortionCertificateClosed C := by
  exact And.intro C.rateDistortionFunctionDefinedClosed
    (And.intro C.achievabilityHoldsClosed
      (And.intro C.converseHoldsClosed
        (data_processing_inequality_closed_from_evidence P C.dataProcessingEvidence)))

end BioinformaticsCanonicalLaneLean
end HautevilleHouse