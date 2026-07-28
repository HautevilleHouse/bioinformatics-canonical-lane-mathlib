import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure ShannonEntropyPackage (A : AdmissibleClass) where
  sourceAlphabet : Type u
  probabilityDistribution : sourceAlphabet → ℚ
  entropyValue : ℚ
  nonnegativity : entropyValue ≥ 0
  maximumAtUniform : entropyValue ≤ Real.log (Fintype.card sourceAlphabet : ℚ)
  chainRuleSatisfied : Prop

structure ShannonEntropyEvidence (A : AdmissibleClass) (S : ShannonEntropyPackage A) where
  nonnegativityClosed : S.nonnegativity
  maximumAtUniformClosed : S.maximumAtUniform
  chainRuleSatisfiedClosed : S.chainRuleSatisfied

def ShannonEntropyClosed (A : AdmissibleClass) (S : ShannonEntropyPackage A) : Prop :=
  S.nonnegativity ∧ S.maximumAtUniform ∧ S.chainRuleSatisfied

theorem shannon_entropy_closed_from_evidence (A : AdmissibleClass) (S : ShannonEntropyPackage A)
    (E : ShannonEntropyEvidence A S) : ShannonEntropyClosed A S :=
  And.intro E.nonnegativityClosed (And.intro E.maximumAtUniformClosed E.chainRuleSatisfiedClosed)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
