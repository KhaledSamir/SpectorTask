using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using Spector.DataAccess;
using Spector.BusinessService;
using Newtonsoft.Json;
using System.Web.Script.Serialization;

namespace SpectorWebApp
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class SpectorWCF
    {
        private iMessageService service = new MessageService();

        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        [WebGet]
        public IEnumerable<SpecMessage> GetAllMessages()
        {
            return service.GetMessages();
        }

        [OperationContract]
        public bool DeleteMessage(int MsgId)
        {
            return service.DeleteMessage(MsgId);
        }

        [OperationContract]
        public SpecMessage FindMessage(int MsgId)
        {
            return service.FindMessage(MsgId);
        }

        [OperationContract]
        
        public SpecMessage AddMessage(string message)
        {
            return service.AddMessage(message);
        }

        [OperationContract]
        public bool UpdateMessage(SpecMessage message)
        {
            return service.UpdateMessage(message);
        }

        // Add more operations here and mark them with [OperationContract]
    }
}
