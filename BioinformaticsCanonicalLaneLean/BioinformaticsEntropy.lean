import BioinformaticsCanonicalLaneLean.BioinformaticsPhylogeneticTree

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure EntropyPackage {S : SequenceAlignmentPackage} (P : PhylogeneticTreePackage S) where
  shannonEntropy : Prop
  mutualInformation : Prop
  entropyRate : Prop
  informationGain : Prop

structure EntropyEvidence {S : SequenceAlignmentPackage} {P : PhylogeneticTreePackage S} (E : EntropyPackage P) where
  shannonEntropyClosed : E.shannonEntropy
  mutualInformationClosed : E.mutualInformation
  entropyRateClosed : E.entropyRate
  informationGainClosed : E.informationGain

def EntropyClosed {S : SequenceAlignmentPackage} {P : PhylogeneticTreePackage S} (E : EntropyPackage P) : Prop :=
  E.shannonEntropy ∧ E.mutualInformation ∧ E.entropyRate ∧ E.informationGain

theorem entropy_closed_from_evidence
    {S : SequenceAlignmentPackage} {P : PhylogeneticTreePackage S}
    (E : EntropyPackage P) (F : EntropyEvidence E) : EntropyClosed E := by
  exact And.intro F.shannonEntropyClosed
    (And.intro F.mutualInformationClosed
      (And.intro F.entropyRateClosed F.informationGainClosed))

end BioinformaticsCanonicalLaneLean
end HautevilleHouse