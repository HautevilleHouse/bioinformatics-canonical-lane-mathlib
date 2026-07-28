import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure SequenceAnalysisPackage where
  scoringMatrix : Type
  gapPenalty : Type
  alignmentAlgorithm : Type
  optimalAlignmentExists : Prop
  alignmentScoreDefined : Prop
  gapPenaltyModel : Prop

structure SequenceAnalysisEvidence (S : SequenceAnalysisPackage) where
  optimalAlignmentExistsClosed : S.optimalAlignmentExists
  alignmentScoreDefinedClosed : S.alignmentScoreDefined
  gapPenaltyModelClosed : S.gapPenaltyModel

def SequenceAnalysisClosed (S : SequenceAnalysisPackage) : Prop :=
  S.optimalAlignmentExists ∧ S.alignmentScoreDefined ∧ S.gapPenaltyModel

theorem sequence_analysis_closed_from_evidence (S : SequenceAnalysisPackage) (E : SequenceAnalysisEvidence S) :
    SequenceAnalysisClosed S :=
  And.intro E.optimalAlignmentExistsClosed (And.intro E.alignmentScoreDefinedClosed E.gapPenaltyModelClosed)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
