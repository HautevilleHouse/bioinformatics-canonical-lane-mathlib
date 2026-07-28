import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BioSequence where
  carrier : Type
  alphabet : Type
  length : Nat
  isGenomic : Prop

default instance : CoeSort BioSequence (Type) := ⟨BioSequence.carrier⟩

structure BioinformaticsAdmittedObject where
  sequence : BioSequence
  isCodingRegion : Prop
  hasOpenReadingFrame : Prop
  conclusion : hasOpenReadingFrame

structure BioinformaticsEndgameState where
  object : BioinformaticsAdmittedObject

def BioinformaticsWitnessClosed (O : BioinformaticsAdmittedObject) : Prop :=
  O.hasOpenReadingFrame

end BioinformaticsCanonicalLaneLean
end HautevilleHouse