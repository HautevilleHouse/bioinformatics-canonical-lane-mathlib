import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure InformationTheoryPackage where
  probabilityDistribution : Type
  entropyFunction : Prop
  mutualInformationDefined : Prop
  channelCapacity : Prop
  sourceCodingTheorem : Prop
  rateDistortionFunction : Prop

structure InformationTheoryEvidence (I : InformationTheoryPackage) where
  entropyFunctionClosed : I.entropyFunction
  mutualInformationDefinedClosed : I.mutualInformationDefined
  channelCapacityClosed : I.channelCapacity
  sourceCodingTheoremClosed : I.sourceCodingTheorem
  rateDistortionFunctionClosed : I.rateDistortionFunction

def InformationTheoryClosed (I : InformationTheoryPackage) : Prop :=
  I.entropyFunction ∧ I.mutualInformationDefined ∧ I.channelCapacity ∧ I.sourceCodingTheorem ∧ I.rateDistortionFunction

theorem information_theory_closed_from_evidence (I : InformationTheoryPackage) (E : InformationTheoryEvidence I) :
    InformationTheoryClosed I :=
  And.intro E.entropyFunctionClosed
    (And.intro E.mutualInformationDefinedClosed
      (And.intro E.channelCapacityClosed (And.intro E.sourceCodingTheoremClosed E.rateDistortionFunctionClosed)))

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
