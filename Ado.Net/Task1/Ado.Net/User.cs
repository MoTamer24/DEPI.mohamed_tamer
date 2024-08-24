

namespace Ado.Net
{
    internal class User
    {
        public int? Id { get; set; }
        public string? Name { get; set; }
        public string? Password { get; set; }
        public string? Email { get; set; }
        public string? Status { get; set; }
        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public int? CountryId { get; set; }
        public string? PostalCode { get; set; }
        public DateTime? CreatedAt { get; set; }
        public override string ToString()
        {
            return $"{Id} : {Name} : {Password} : {Email} :" +
                $" {Status} : {Address1} : {Address2} : {City} : {CountryId} : {PostalCode} : {CreatedAt}";
        }
    }

}

