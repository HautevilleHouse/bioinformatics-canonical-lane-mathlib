import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure AminoAcid where
  name : String
  threeLetter : String
  oneLetter : Char

structure ProteinStructurePackage where
  sequence : List AminoAcid
  secondaryStructure : List (String × String)  -- residue, structure (e.g., helix, sheet)
  tertiaryCoordinates : List (Float × Float × Float)
  foldingMethod : String

structure ProteinStructureEvidence (P : ProteinStructurePackage) where
  sequenceNonEmpty : P.sequence ≠ []
  secondaryLengthMatches : P.secondaryStructure.length = P.sequence.length
  coordinatesLengthMatches : P.tertiaryCoordinates.length = P.sequence.length

structure ProteinStructureClosed (P : ProteinStructurePackage) : Prop :=
  sequenceNonEmpty : P.sequence ≠ []
  secondaryLengthMatches : P.secondaryStructure.length = P.sequence.length
  coordinatesLengthMatches : P.tertiaryCoordinates.length = P.sequence.length

theorem protein_structure_closed_from_evidence (P : ProteinStructurePackage) (E : ProteinStructureEvidence P) : ProteinStructureClosed P :=
by
  exact ⟨E.sequenceNonEmpty, E.secondaryLengthMatches, E.coordinatesLengthMatches⟩

end BioinformaticsCanonicalLaneLean
end HautevilleHouse