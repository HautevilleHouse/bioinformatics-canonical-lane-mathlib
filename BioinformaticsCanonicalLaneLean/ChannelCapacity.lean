import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.ShannonEntropy

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure ChannelCapacityPackage (A : AdmissibleClass) (S : ShannonEntropyPackage A) where
  channelMatrix : Type u → Type v
  mutualInformation : ℚ
  capacityValue : ℚ
  capacityAchievability : Prop
  codingTheoremSatisfied : Prop

structure ChannelCapacityEvidence (A : AdmissibleClass) (S : ShannonEntropyPackage A)
    (C : ChannelCapacityPackage A S) where
  capacityAchievabilityClosed : C.capacityAchievability
  codingTheoremSatisfiedClosed : C.codingTheoremSatisfied

def ChannelCapacityClosed (A : AdmissibleClass) (S : ShannonEntropyPackage A)
    (C : ChannelCapacityPackage A S) : Prop :=
  C.capacityAchievability ∧ C.codingTheoremSatisfied

theorem channel_capacity_closed_from_evidence (A : AdmissibleClass) (S : ShannonEntropyPackage A)
    (C : ChannelCapacityPackage A S) (E : ChannelCapacityEvidence A S C) : ChannelCapacityClosed A S C :=
  And.intro E.capacityAchievabilityClosed E.codingTheoremSatisfiedClosed

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
