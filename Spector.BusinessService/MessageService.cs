using System;
using System.Collections.Generic;
using System.Linq;
using Spector.DataAccess;


namespace Spector.BusinessService
{
    public class MessageService : iMessageService
    {
        private SpectorDBEntities db = new SpectorDBEntities();

        public IEnumerable<SpecMessage> GetMessages()
        {
            return db.SpecMessages.ToList();
        }

        public SpecMessage AddMessage(string message)
        {
            try
            {
                SpecMessage spec = new SpecMessage();
                spec.Message = message;
                db.SpecMessages.Add(spec);
                SaveChanges();
                return spec;
            }
            catch (Exception ex)
            {
                Logger.log(ex.Message);
                return null;
            }

        }

        public bool DeleteMessage(int MsgId)
        {
            try
            {
                SpecMessage message = db.SpecMessages.FirstOrDefault(m => m.ID == MsgId);
                db.SpecMessages.Remove(message);
                return SaveChanges();
            }

            catch (Exception ex)
            {
                Logger.log(ex.Message);
                return false;
            }
        }

        private bool SaveChanges()
        {
            return db.SaveChanges() > 0;
        }

        public SpecMessage FindMessage(int MsgId)
        {
            return db.SpecMessages.Find(MsgId);
        }

        public bool UpdateMessage(SpecMessage message)
        {
            try
            {
                SpecMessage current = FindMessage(message.ID);
                current.Message = message.Message;
                return SaveChanges();
            }

            catch (Exception ex)
            {
                Logger.log(ex.Message);
                return false;
            }
        }
    }
}
