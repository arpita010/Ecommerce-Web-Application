<div class="modal fade" id="editProductModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4>Edit Product</h4>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="editProduct" method="post">
					<input type="hidden" name="operation" value="edit"> <input
						type="hidden" name="editPid" id="editPid" value="">
					<div class="form-group">
						<input type="text" class="form-control" name="newTitle"
							placeholder="Enter new Product Title">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" name="newPrice"
							placeholder="Enter new Price">
					</div>

					<div class="form-group">
						<input type="number" class="form-control" name="newDiscount"
							placeholder="Enter Discount rate">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" name="newQuantity"
							placeholder="Enter Available Quantity">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-danger">Save Changes</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</div>