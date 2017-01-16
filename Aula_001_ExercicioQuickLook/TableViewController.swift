import UIKit
import QuickLook

class TableViewController: UITableViewController, QLPreviewControllerDataSource {
    
    //MARK: Propriedades
    var arrayAnexos : [String] = ["5 Conselhos","Identidade da sua Empresa","Marketing Digital"]
    var anexoAtual = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAnexos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        cell.textLabel?.text = "\(arrayAnexos[indexPath.row])"
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        anexoAtual = arrayAnexos[indexPath.row]
        
        let quickLook = QLPreviewController()
        quickLook.dataSource = self
        self.navigationController?.pushViewController(quickLook, animated: true)
        
    }
    
    //MARK: Métodos de QLPreviewControllerDataSource
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return arrayAnexos.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let raizApp = Bundle.main
        let caminhoArquivo = raizApp.path(forResource: anexoAtual, ofType: "pdf")
        let urlArquivo = URL(fileURLWithPath: caminhoArquivo!)
        return urlArquivo as QLPreviewItem
    }
    




}
