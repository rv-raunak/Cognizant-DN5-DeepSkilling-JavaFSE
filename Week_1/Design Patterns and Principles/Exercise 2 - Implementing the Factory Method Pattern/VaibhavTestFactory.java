public class VaibhavTestFactory {
    public static void main(String[] args) {
        System.out.println("--- testing factory pattern ---");

        // testing word doc creation
        DocumentFactory wordFact = new WordDocumentFactory();
        Document doc1 = wordFact.createDocument();
        doc1.open();

        // testing pdf doc creation
        DocumentFactory pdfFact = new PdfDocumentFactory();
        Document doc2 = pdfFact.createDocument();
        doc2.open();

        // testing excel doc creation
        DocumentFactory excelFact = new ExcelDocumentFactory();
        Document doc3 = excelFact.createDocument();
        doc3.open();
    }
}


// MY LEARNING NOTES FOR EXERCISE 2: //
// What I learnt through this:

// - the whole point of this pattern is to separate the object creation from the main code. instead of hardcoding new WordDocument() in my main method, the specific factory class handles it.

// - it makes the code flexible. if we ever add a powerpoint file later, we just make a new factory for it and dont have to rewrite the main logic.
// Mistakes I did:

// - initially I messed up the inheritance. I wrote implements DocumentFactory instead of extends DocumentFactory for the concrete factories, which threw a compiler error b/c DocumentFactory is an abstract class, not an interface.

// - I accidentally named the method makeDocument() in one of my classes but the prompt strictly asked for createDocument(), so the @Override annotation threw an error until I fixed the typo.
