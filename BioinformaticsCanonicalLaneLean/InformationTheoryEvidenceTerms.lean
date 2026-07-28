import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.DataProcessingInequalityPackage

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure ShannonEntropyEvidenceTerms where
  entropyDefined : Bool
  jointEntropyDefined : Bool
  conditionalEntropyDefined : Bool
  chainRuleHolds : Prop

default instance : Inhabited ShannonEntropyEvidenceTerms where
  default := {
    entropyDefined := true
    jointEntropyDefined := true
    conditionalEntropyDefined := true
    chainRuleHolds := True
  }

structure ChannelCapacityEvidenceTerms where
  capacityDefined : Bool
  capacityReachable : Bool
  codingTheoremHolds : Prop

default instance : Inhabited ChannelCapacityEvidenceTerms where
  default := {
    capacityDefined := true
    capacityReachable := true
    codingTheoremHolds := True
  }

structure RateDistortionEvidenceTerms where
  rateDistortionFunctionDefined : Bool
  achievabilityHolds : Prop
  converseHolds : Prop

default instance : Inhabited RateDistortionEvidenceTerms where
  default := {
    rateDistortionFunctionDefined := true
    achievabilityHolds := True
    converseHolds := True
  }

end BioinformaticsCanonicalLaneLean
end HautevilleHouse