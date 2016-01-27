using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Spector.DataAccess;

namespace Spector.BusinessService
{
    public interface iMessageService
    {
        IEnumerable<SpecMessage> GetMessages();

        SpecMessage FindMessage(int MsgId);

        SpecMessage AddMessage(string message);

        bool UpdateMessage(SpecMessage message);

        bool DeleteMessage(int MsgId);

    }
}
