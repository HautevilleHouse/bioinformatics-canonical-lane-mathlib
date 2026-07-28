import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure BioinformaticsAdmittedObject where
  sequenceSpace : Type
  alignmentClosed : Prop
  phylogeneticConsistency : Prop
  entropyFunctional : Prop

structure AdmissibleClass where
  object : BioinformaticsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BioinformaticsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def BioinformaticsWitnessClosed (O : BioinformaticsAdmittedObject) : Prop :=
  O.alignmentClosed ∧ O.phylogeneticConsistency ∧ O.entropyFunctional

end BioinformaticsCanonicalLaneLean
end HautevilleHouse