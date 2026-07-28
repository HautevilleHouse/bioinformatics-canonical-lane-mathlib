import BioinformaticsCanonicalLaneLean.BioinformaticsGateLemmas

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure SequenceAlignmentPackage where
  referenceGenome : Type
  readSequences : Type
  alignmentScore : Prop
  gapPenalty : Prop
  substitutionMatrix : Prop

structure SequenceAlignmentEvidence (S : SequenceAlignmentPackage) where
  alignmentScoreClosed : S.alignmentScore
  gapPenaltyClosed : S.gapPenalty
  substitutionMatrixClosed : S.substitutionMatrix

def SequenceAlignmentClosed (S : SequenceAlignmentPackage) : Prop :=
  S.alignmentScore ∧ S.gapPenalty ∧ S.substitutionMatrix

theorem sequence_alignment_closed_from_evidence
    (S : SequenceAlignmentPackage) (E : SequenceAlignmentEvidence S) :
    SequenceAlignmentClosed S := by
  exact And.intro E.alignmentScoreClosed
    (And.intro E.gapPenaltyClosed E.substitutionMatrixClosed)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse