import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BioAdmittedObject where
  message : String
  sequenceLength : Nat
  observedEntropy : ℕ → ℚ  -- simplified entropy distribution
  encodingEfficiency : Prop

structure AdmissibleClass where
  object : BioAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.encodingEfficiency ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
