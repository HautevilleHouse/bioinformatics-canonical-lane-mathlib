import BioinformaticsCanonicalLaneLean.BioinformaticsGateLemmas

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

def ConstrainedBioinformaticsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bioinformatics_endgame (A : AdmissibleClass) :
    ConstrainedBioinformaticsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse