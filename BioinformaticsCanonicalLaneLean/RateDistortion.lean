import HautevilleHouse.BioinformaticsCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.ShannonEntropy

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure RateDistortionPackage (S : ShannonEntropyPackage) where
  sourceDistribution : S.probabilityDistribution
  distortionMeasure : S.probabilityDistribution → S.probabilityDistribution → ℝ
  rateDistortionFunction : ℝ → ℝ
  distortionAchievable : Prop
  rateDistortionTheorem : Prop
  rateDistortionTheoremProof : rateDistortionTheorem

structure RateDistortionEvidence {S : ShannonEntropyPackage} (R : RateDistortionPackage S) where
  distortionAchievableClosed : R.distortionAchievable
  rateDistortionTheoremProofClosed : R.rateDistortionTheorem

def RateDistortionClosed {S : ShannonEntropyPackage} (R : RateDistortionPackage S) : Prop :=
  R.distortionAchievable ∧ R.rateDistortionTheorem

theorem rate_distortion_closed_from_evidence {S : ShannonEntropyPackage}
    (R : RateDistortionPackage S) (E : RateDistortionEvidence R) :
    RateDistortionClosed R := by
  exact And.intro E.distortionAchievableClosed E.rateDistortionTheoremProofClosed

end BioinformaticsCanonicalLaneLean
end HautevilleHouse