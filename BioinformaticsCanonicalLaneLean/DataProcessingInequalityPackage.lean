import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure DataProcessingInequalityPackage where
  markovChain : Prop
  mutualInformationNonincrease : Bool
  dataProcessingInequality : Bool

structure DataProcessingInequalityEvidence (P : DataProcessingInequalityPackage) where
  markovChainClosed : P.markovChain
  mutualInformationNonincreaseClosed : P.mutualInformationNonincrease
  dataProcessingInequalityClosed : P.dataProcessingInequality

def DataProcessingInequalityClosed (P : DataProcessingInequalityPackage) : Prop :=
  P.markovChain ∧ P.mutualInformationNonincrease ∧ P.dataProcessingInequality

theorem data_processing_inequality_closed_from_evidence
    (P : DataProcessingInequalityPackage) (E : DataProcessingInequalityEvidence P) :
    DataProcessingInequalityClosed P := by
  exact And.intro E.markovChainClosed
    (And.intro E.mutualInformationNonincreaseClosed E.dataProcessingInequalityClosed)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse