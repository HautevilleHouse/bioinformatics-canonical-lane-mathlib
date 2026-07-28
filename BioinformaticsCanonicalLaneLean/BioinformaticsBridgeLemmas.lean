import BioinformaticsCanonicalLaneLean.BioinformaticsAdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BioinformaticsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.alignmentClosed
    (And.intro A.object.phylogeneticConsistency A.object.entropyFunctional)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse