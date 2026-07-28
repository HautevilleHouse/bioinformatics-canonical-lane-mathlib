import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.ShannonEntropy
import HautevilleHouse.BioinformaticsCanonicalLaneLean.ChannelCapacity

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.encodingEfficiency

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.encodingEfficiency

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedBioinformaticsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bioinformatics_endgame (A : AdmissibleClass) : ConstrainedBioinformaticsClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
